export interface dynamicReturnModel {
  data: dynamicDataResult;
}

export interface dynamicDataResult {
  posts: dynamicPostsResult;
}

export interface dynamicPostsResult {
  data: dynamicData[];
}

export interface dynamicData {
  id: string;
  title: string;
}