import { Client } from "./client";

export async function init() {
  let client = new Client("regtest");
  let result = await client.init([]);
  if (typeof result == "number") {
    console.log("At block number: ", result);
  } else {
    console.log("Init local chain: ");
    console.log(result);
  }
}

(async () => {
  await init();
})().catch((err) => console.error(err));
