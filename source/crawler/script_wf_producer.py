import yaml
import requests
from bs4 import BeautifulSoup
import os
from io import BytesIO
import zipfile
from urllib.request import urlopen

dirname = os.path.dirname(__file__)

WF_BASE_URL = (
    "https://package.pentium.network/service/rest/repository/browse/workflows/"
)
SCRIPT_BASE_URL = (
    "https://package.pentium.network/service/rest/repository/browse/scripts/"
)

WF_ENTRY_FILE = "manifest.json"
WF_SAVE_PATH = os.path.join(dirname, os.pardir, "library", "workflows_list.html")
SCRIPT_SAVE_PATH = os.path.join(dirname, os.pardir, "library", "scripts_list.html")


def to_tuple(version_str):
    return tuple(map(int, (version_str.split("."))))


def get_href(url_str):
    _r = requests.get(url_str)
    _soup = BeautifulSoup(_r.content, "html.parser")
    v_urls = _soup.findAll("a", href=True)
    return v_urls


def get_last_version(url_str):
    v_urls = get_href(url_str)
    last_version = max(to_tuple(h.string) for h in v_urls[1:])
    return ".".join(str(v) for v in last_version)


def extract_wf(download_url):
    resp = urlopen(download_url)
    file_bytes = BytesIO(resp.read())
    wf_zip = zipfile.ZipFile(file_bytes)
    wf_name = None
    for name in wf_zip.namelist():
        if WF_ENTRY_FILE != name:
            continue
        c = wf_zip.open(name).read()
        c = c.replace(b"\t", b"")
        manifest = yaml.safe_load(c)
        wf_name = manifest.get("entry")
        break

    wf = wf_zip.open(wf_name).read()
    return yaml.safe_load(wf)


def get_wf_list():
    r = requests.get(WF_BASE_URL)
    soup = BeautifulSoup(r.content, "html.parser")
    wf_urls = soup.findAll("a", href=True)
    result = """<!DOCTYPE html>
<html>
<table class="ref">
    <tr>
        <th>Name</th>
        <th>Template id</th>
        <th>Description</th>
    </tr>
"""
    for i in wf_urls:
        href = i.get("href")
        wf_dir_url = os.path.join(WF_BASE_URL, href)
        version = get_last_version(wf_dir_url)

        wf_url = os.path.join(wf_dir_url, version)
        wf_href = get_href(wf_url)

        download_url = None
        for i in wf_href:
            if i.get("href", "").endswith(".zip"):
                download_url = i["href"]
                break
        wf = extract_wf(download_url)

        wf_name = wf.get("graph", {}).get("metadata", {}).get("title")
        wf_desc = wf.get("graph", {}).get("metadata", {}).get("description")
        wf_id = wf.get("graph", {}).get("metadata", {}).get("templateId")

        result += f"""
    <tr>
        <td>{wf_name}</td>
        <td>{wf_id}</td>
        <td>{wf_desc}</td>
    </tr>"""
    return result + """</table>
<br/>
<br/>
</html>
"""


def extract_script(download_url):
    resp = urlopen(download_url)
    file_bytes = BytesIO(resp.read())
    script_zip = zipfile.ZipFile(file_bytes)
    script_name = None
    for name in script_zip.namelist():
        if not name.endswith(".para"):
            continue
        script_name = name
        break

    script = script_zip.open(script_name).read()
    return yaml.safe_load(script)


def get_script_list():
    r = requests.get(SCRIPT_BASE_URL)
    soup = BeautifulSoup(r.content, "html.parser")
    script_urls = soup.findAll("a", href=True)
    result = """<!DOCTYPE html>
<html>
<table class="ref">
    <tr>
        <th>Name</th>
        <th>Script id</th>
        <th>Description</th>
        <th>Para schema file</th>
    </tr>
"""
    for i in script_urls:
        href = i.get("href")
        dir_url = os.path.join(SCRIPT_BASE_URL, href)
        version = get_last_version(dir_url)

        script_url = os.path.join(dir_url, version, "dist")
        script_href = get_href(script_url)

        download_url = None
        for i in script_href:
            if i.get("href", "").endswith(".zip"):
                download_url = i["href"]
                break
        script = extract_script(download_url)

        script_name = script.get("name")
        script_desc = script.get("description")
        script_id = script.get("id")
        
        stream = yaml.dump(script, sort_keys=False, allow_unicode=True)

        with open(os.path.join(dirname, os.pardir, "library", "scripts", script_id + ".rst"), "w") as f:
            f.writelines([script_id, "\n**********************************\n| ", script_name, "\n| ", script_desc,"\n\n.. code-block:: yaml\n", "\n    "])
            f.write(stream.replace("\n", "\n    "))

        result += f"""
    <tr>
        <td>{script_name}</td>
        <td>{script_id}</td>
        <td>{script_desc}</td>
        <td><a class="reference internal" href="scripts/{script_id}.html">view schema</a></td>
    </tr>"""
    return result + """</table>
<br/>
<br/>
</html>
"""

if __name__ == "__main__":
    wf_result = get_wf_list()
    with open(WF_SAVE_PATH, "w") as f:
        f.write(wf_result)

    script_result = get_script_list()
    with open(SCRIPT_SAVE_PATH, "w") as f:
        f.write(script_result)
    
    