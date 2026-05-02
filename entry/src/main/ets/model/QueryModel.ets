interface PaginateInterface {
  page: number;
  limit: number;
}

interface OptionsInterface {
  paginate: PaginateInterface;
}

interface VariablesInterface {
  options: OptionsInterface;
}

export class QueryModel {
  //Default request without any parameter input
  static readonly defaultRequest: string = `
    query { __typename }
  `;
  static readonly defaultBody: string = JSON.stringify({ query: QueryModel.defaultRequest });
  //Default request with static parameter input
  static readonly staticVariableRequest: string = `query {
    user(id: 1) {
      posts {
        data {
          id
          title
        }
      }
    }
  }`;
  static readonly staticVariableBody: string = JSON.stringify({ query: QueryModel.staticVariableRequest });
  //Default request with dynamic parameter input
  static readonly dynamicVariableRequest = `query (
      $options: PageQueryOptions
    ) {
      posts(options: $options) {
        data {
          id
          title
        }
        meta {
          totalCount
        }
      }
    }`;

  static dynamicVariableBody(page: number, limit: number): string {
    return JSON.stringify({
      query: QueryModel.dynamicVariableRequest, variables: ({
        options: ({
          paginate: ({
            page: page,
            limit: limit
          } as PaginateInterface)
        } as OptionsInterface)
      } as VariablesInterface)
    });
  }
}