'use strict';

const { runServer } = require('../lib');

(async () => {
  await runServer();
})().catch((err) => console.error(err));
