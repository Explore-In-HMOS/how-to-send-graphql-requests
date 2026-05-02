export interface staticReturnModel {
  data: staticDataResult;
}

export interface staticDataResult {
  user: staticUserResult;
}

export interface staticUserResult {
  posts: staticPostResult;
}
export interface staticPostResult {
  data: staticData[];
}

export interface staticData {
  id: string;
  title: string;
}