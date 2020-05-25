import traceback
from collections import namedtuple

from blcks import blcks
import requests

FUNC_NAME = "appcheck"
ITUNES_API_URL = "https://itunes.apple.com/lookup"
#  https://itunes.apple.com/lookup?id=310633997

logger = blcks.logger
APP = namedtuple("app", ["name", "id", "note"], defaults=("", "", ""))


class ResultCode:
    SUCCESS = 0

    # error codes: > 4000
    ERROR_UNKNOWN = 4001


@blcks
def main(event, context):
    pass


@blcks.script(FUNC_NAME)
def process(check_list):
    print("ccccccc", check_list)
    result = {
        "code": ResultCode.SUCCESS,
        "msg": "success",
        "exists": [],
        "exists_count": 0,
        "notfounds": [],
        "notfounds_count": 0,
    }

    if len(check_list) <= 0:
        logger.warning("nothing to check")
        return result

    exists = []
    notfounds = []
    failures = []
    checked_set = set()
    for c in check_list:
        if not c:
            continue

        try:
            check_items = c.split(",", maxsplit=2)
            check_items = [i.strip() for i in check_items]
            app = APP(*check_items)

            if app.id in checked_set:
                continue
            if not app.id:
                logger.warning(f"check item format error: {c}")
                continue

            check_result_obj = {"name": app.name, "id": app.id, "note": app.note}
            resp = check_app(app.id)
            if resp:
                exists.append(check_result_obj)
            else:
                notfounds.append(check_result_obj)
            checked_set.add(app.id)
        except Exception as e:
            logger.warning(f"checking failed, {c}")
            logger.warning(
                f"exception: {repr(e)}",
                inputParamsStr=traceback.format_exc(),
            )
            if check_result_obj:
                failures.append(check_result_obj)

    result["code"] = ResultCode.SUCCESS
    result["exists"] = exists
    result["exists_count"] = len(exists)
    result["notfounds"] = notfounds
    result["notfounds_count"] = len(notfounds)
    result["failures"] = failures
    result["failures_count"] = len(failures)
    return result


def check_app(app_id):
    resp = requests.get(
        url=ITUNES_API_URL,
        params={"id": app_id},
        headers={},
        timeout=60,
    )
    resp_dict = resp.json()
    if resp_dict["resultCount"] == 0:
        return None
    return resp_dict
