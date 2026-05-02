import { QueryModel } from '../model/QueryModel';
import { GraphQLService } from '../service/GraphQLService';

@Entry
@Component
struct Index {
  @State message: string = 'Didn\'t sent request yet';
  private graphQLService = new GraphQLService()

  build() {
    Swiper() {
      Column(){
        Text(this.message)
        Button('Default Request').onClick(async (event: ClickEvent) => {
          this.message = await this.graphQLService.fetchDefaultRequest(QueryModel.defaultBody)
        });
      }
      .height('100%')
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column(){
        Text(this.message)
        Button('Static Variable Request')
          .width('90%')
          .onClick(async (event: ClickEvent) => {
          this.message = await this.graphQLService.fetchStaticVariableRequests(QueryModel.staticVariableBody)
        });
      }
      .height('100%')
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Column(){
        Text(this.message)
        Button('Dynamic Variable Request')
          .width('90%')
          .onClick(async (event: ClickEvent) => {
          this.message = await this.graphQLService.fetchDynamicVariableRequests(QueryModel.dynamicVariableBody(2,5))
        });
      }
      .height('100%')
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }.onChange((index: number) => {
      this.message = 'Didn\'t sent request yet';
    });
  }
}