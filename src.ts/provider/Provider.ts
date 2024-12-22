export class AbstractProvider {
  async call(method: string, params: any[]): Promise<any>;
}
