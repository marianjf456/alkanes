export class AbstractSigner {
  getProvider(): IProvider;
  signPsbt(hex: string): any;
  signMessage(hex: string): any;
}
