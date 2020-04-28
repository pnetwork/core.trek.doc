from blcks import blcks
import json
import redis

FAAS_METHOD_NAME = "detectredis"
logger = blcks.logger


@blcks
def main(event, context):
    pass


@blcks.script(FAAS_METHOD_NAME)
def process(tag_name):
    result = {
        "fail_hosts_count": 0,
        "fail_hosts": []
    }
    host_service = blcks.createService(blcks.ServiceName.HostsManager)
    hosts = host_service.getHosts(search="tag:redis")
    host_tags = []
    for h in hosts.get("data"):
        h_id = h["id"]
        h_ip = h["ip"]
        host_tags.append({"id": h_id, "type": "server"})
        try:
            redis_host = h_ip
            r = redis.Redis(redis_host, socket_connect_timeout=5)
            if not r.ping():
                result["fail_hosts"].append({"id": h_id, "ip": h_ip, "name": h["name"]})
        except redis.exceptions.RedisError:
            result["fail_hosts"].append({"id": h_id, "ip": h_ip, "name": h["name"]})

    patch_data = [{"name": tag_name, "tagged": False, "assets": host_tags}]
    tag_service = blcks.createService(blcks.ServiceName.TagManager)
    tag_service.updateTags(patch_data)

    result["fail_hosts_count"] = len(result["fail_hosts"])
    blcks.logger.info(msg="output result", inputParamsStr=json.dumps(result))

    return result
