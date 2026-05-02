import http from '@ohos.net.http';
import { defaultReturnModel } from '../model/DefaultReturnModel';
import { dynamicReturnModel } from '../model/DynamicReturnModel';
import { staticReturnModel } from '../model/StaticReturnModel';

export class GraphQLService {
  private defaultLink: string = '{"host": "flyby-router-demo.herokuapp.com/"}';
  private variableLink: string = '{"host": "graphqlzero.almansi.me/api"}';

  private defaultConfig: Record<string, string> = JSON.parse(this.defaultLink) as Record<string, string>;
  private variableConfig: Record<string, string> = JSON.parse(this.variableLink) as Record<string, string>;
  private defaultUrl: string = `https://${this.defaultConfig.host}`;
  private variableUrl: string = `https://${this.variableConfig.host}`;

  async fetchDefaultRequest(queryBody: string): Promise<string> {
    console.info('bodyStructure:',`${queryBody}`)
    const httpRequest = http.createHttp();

    return httpRequest.request(this.defaultUrl, {
      method: http.RequestMethod.POST,
      header: { 'Content-Type': 'application/json' },
      extraData: queryBody,
      expectDataType: http.HttpDataType.STRING
    }).then((response) => {
      if (response.responseCode !== 200) {
        console.info('HTTP result:', `Error ${response.responseCode}`);
        return `HTTP Error:  ${response.responseCode}`;
      }
      console.info('HTTP result:', `Success ${response.result}`);
      const parsed: defaultReturnModel = JSON.parse(response.result as string);
      console.info('HTTP result:', `Success ${parsed.data.__typename}`);
      return `Success ${parsed.data.__typename}`;
    }).finally(() => {
      httpRequest.destroy();
      return `Error: Couldn't send request`;
    });
  }

  async fetchStaticVariableRequests(queryBody: string): Promise<string> {
    console.info('bodyStructure:',`${queryBody}`)
    const httpRequest = http.createHttp();

    return httpRequest.request(this.variableUrl, {
      method: http.RequestMethod.POST,
      header: { 'Content-Type': 'application/json' },
      extraData: queryBody,
      expectDataType: http.HttpDataType.STRING
    }).then((response) => {
      if (response.responseCode !== 200) {
        console.info('HTTP result:', `Error ${response.responseCode}`);
        return `HTTP Error:  ${response.responseCode}`;
      }
      console.info('HTTP result:', `Success ${response.result}`);
      const parsed: staticReturnModel = JSON.parse(response.result as string);
      return `Part of data(id:title)\n${parsed.data.user.posts.data[0].id}:${parsed.data.user.posts.data[0].title}\n${parsed.data.user.posts.data[1].id}:${parsed.data.user.posts.data[1].title}`;
    }).finally(() => {
      httpRequest.destroy();
      return `Error: Couldn't send request`;
    });
  }

  async fetchDynamicVariableRequests(queryBody: string): Promise<string> {
    console.info('bodyStructure:',`${queryBody}`)
    const httpRequest = http.createHttp();

    return httpRequest.request(this.variableUrl, {
      method: http.RequestMethod.POST,
      header: { 'Content-Type': 'application/json' },
      extraData: queryBody,
      expectDataType: http.HttpDataType.STRING
    }).then((response) => {
      if (response.responseCode !== 200) {
        console.info('HTTP result:', `Error ${response.responseCode} ${response.result}`);
        return `HTTP Error:  ${response.responseCode}`;
      }
      console.info('HTTP result:', `Success ${response.result}`);
      const parsed: dynamicReturnModel = JSON.parse(response.result as string);

      return `Part of data(id:title)\n${parsed.data.posts.data[0].id}:${parsed.data.posts.data[0].title}\n${parsed.data.posts.data[1].id}:${parsed.data.posts.data[1].title}`;
    }).finally(() => {
      httpRequest.destroy();
      return `Error: Couldn't send request`;
    });
  }
}