from robot.api import logger
from robot.api.deco import keyword, library


@library(scope="global")
class FakeLibrary:
    def __init__(self):
        self.ssh_client: dict | None = None

    @keyword
    def connect_to_radio(self, ip, username, password):
        logger.info(f"Connecting to {ip} with {username}/{password}")
        self.ssh_client = dict(ip=ip, username=username, password=password)
        logger.debug(id(self.ssh_client))

    @keyword
    def disconnect_from_radio(self):
        logger.info(f"Disconnecting from {self.ssh_client}")
        logger.debug(id(self.ssh_client))
        self.ssh_client.clear()

    @keyword
    def get_connection(self):
        return self.ssh_client
