import yaml
import requests
from bs4 import BeautifulSoup
import os
from io import BytesIO
import zipfile
from urllib.request import urlopen
from concurrent.futures import ThreadPoolExecutor
import time

dirname = os.path.dirname(__file__)

WF_BASE_URL = (
    "https://package.pentium.network/service/rest/repository/browse/workflows/"
)
SCRIPT_BASE_URL = (
    "https://package.pentium.network/service/rest/repository/browse/scripts/"
)

WF_ENTRY_FILE = "manifest.json"
WF_SAVE_PATH = os.path.join(dirname, os.pardir, "library", "workflows_list.rst")
SCRIPT_SAVE_PATH = os.path.join(dirname, os.pardir, "library", "scripts_list.rst")
WORKERS_LIMIT = 10
DEFAULT_THREADS_EXECUTION_TIMEOUT = 300


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


def service_threads_handler(
        service_method,
        *args,
        workers=WORKERS_LIMIT,
        timeouts=DEFAULT_THREADS_EXECUTION_TIMEOUT,
):
    with ThreadPoolExecutor(max_workers=workers) as executor:
        futures = executor.map(service_method, *args, timeout=timeouts)
        result = list(filter(None, list(futures)))
        return result


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

    try:
        wf = wf_zip.open(wf_name).read()
        return yaml.safe_load(wf)
    except Exception:
        pass


def get_wf_content(i):
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
    if not wf:
        return

    wf_name = wf.get("graph", {}).get("metadata", {}).get("title")
    wf_desc = wf.get("graph", {}).get("metadata", {}).get("description")
    wf_id = wf.get("graph", {}).get("metadata", {}).get("templateId")

    result = f"""

   * - {wf_name}
     - {wf_id}
     - {wf_desc} """
    return result


def get_wf_list():
    r = requests.get(WF_BASE_URL)
    soup = BeautifulSoup(r.content, "html.parser")
    wf_urls = soup.findAll("a", href=True)
    result = """.. list-table:: 
   :widths: 20 50 30
   :class: ref
   :header-rows: 1

   * - Name
     - Template id
     - Description
"""

    results = service_threads_handler(get_wf_content, wf_urls)
    return result + "".join(results)


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

    try:
        script = script_zip.open(script_name).read()
        return yaml.safe_load(script)
    except Exception:
        pass


def get_script_content(i):
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
    if not script:
        return

    script_name = script.get("title")
    script_desc = script.get("description")
    if "\n" in script_desc:
        script_desc = "| " + script_desc.replace("\n", "\n       | ")
    script_id = script.get("id")

    stream = yaml.dump(script, sort_keys=False, allow_unicode=True)

    with open(
            os.path.join(dirname, os.pardir, "library", "scripts", script_id + ".rst"), "w"
    ) as f:
        f.writelines(
            [
                script_id,
                "\n**********************************\n| ",
                script_name,
                "\n| ",
                script_desc,
                "\n\n.. code-block:: yaml\n",
                "\n    ",
            ]
        )
        f.write(stream.replace("\n", "\n    "))

    return f"""

   * - {script_name}
     - {script_id}
     - {script_desc}
     - :doc:`view schema<scripts/{script_id}>`"""

    return result


def get_script_list():
    r = requests.get(SCRIPT_BASE_URL)
    soup = BeautifulSoup(r.content, "html.parser")
    script_urls = soup.findAll("a", href=True)

    result = """.. list-table:: 
   :widths: 20 30 30 20
   :class: ref
   :header-rows: 1

   * - Name
     - Script id
     - Description
     - Para schema file
"""
    results = service_threads_handler(get_script_content, script_urls)
    return result + "".join(results)


if __name__ == "__main__":
    start_time = time.time()

    wf_result = get_wf_list()
    with open(WF_SAVE_PATH, "w") as f:
        f.write(wf_result)
    print("--- %s seconds ---" % (time.time() - start_time))
    print("workflow template crawler finish.")

    start_time = time.time()
    script_result = get_script_list()
    with open(SCRIPT_SAVE_PATH, "w") as f:
        f.write(script_result)
    print("--- %s seconds ---" % (time.time() - start_time))
    print("script crawler finish.")
