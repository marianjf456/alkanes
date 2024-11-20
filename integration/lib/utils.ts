export const timeout = (delay: number) =>
  new Promise((resolve) => {
    setTimeout(resolve, delay);
  });
