import { Client } from "../lib/client";
import { getLogger } from "../lib/logger";

const logger = getLogger('alkanes:init');

export async function init() {
  let client = new Client("regtest");
  let result = await client.init([]);
  if (typeof result == "number") {
    logger.error("At block number: ", result);
  } else {
    logger.info("init local chain: complete");
  }
}

(async () => {
  await init();
})().catch((err) => console.error(err));
