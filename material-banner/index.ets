import {BannerModel,BannerType} from './BannerModel'

@Component
export struct MaterialBanner{
  @State bModel:BannerModel=new BannerModel(BannerType.OneButton);
  buttonAction1:()=>void;
  buttonAction2:()=>void;
  image:Resource;

  aboutToAppear(){
    if(this.bModel.getBannerMessage()==null || this.bModel.getBannerMessage()==undefined){
      console.log("Banner Message not set")
    }
    if(this.bModel.getButtonText1()==null || this.bModel.getButtonText1()==undefined){
      console.log("Button Text 1 not set")
    }
    if(this.bModel.getBannerType()==BannerType.TwoButton && (this.bModel.getButtonText2()==null || this.bModel.getButtonText2()==undefined)){
      console.log("Button Text 2 not set")
    }
    if(this.bModel.getBannerType()==BannerType.ImageButton && (this.bModel.getButtonText2()==null || this.bModel.getButtonText2()==undefined)){
      console.log("Button Text 2 not set")
    }
    if(this.bModel.getBannerType()==BannerType.ImageButton && (this.image==null || this.image==undefined)){
      console.log("Image not selected")
    }
  }

  build(){
    Column(){
      if(this.bModel.getBannerType()==BannerType.OneButton){
        Column() {
          Flex({ justifyContent: FlexAlign.SpaceBetween }) {
            Text(this.bModel.getBannerMessage()).padding({ top: 10, bottom: 8, left: 20 })
              .fontSize(this.bModel.getTextSize()).fontFamily(this.bModel.getTextStyle())
            Button(this.bModel.getButtonText1(), { type: ButtonType.Normal, stateEffect: true }).borderRadius(8)
              .backgroundColor(this.bModel.getButtonColor())
              .onClick(()=>{
                this.buttonAction1()
                this.bModel.setShow(Visibility.None)
              })
          }.width(360).height(54)
        }.width('100%').visibility(this.bModel.getShow())
      }
      else if(this.bModel.getBannerType()==BannerType.TwoButton){
        Column() {
          Text(this.bModel.getBannerMessage())
            .fontSize(this.bModel.getTextSize()).fontFamily(this.bModel.getTextStyle())
            .padding({ top: 36, left: 16 }).width('100%')
          Flex({ direction: FlexDirection.RowReverse, alignItems: ItemAlign.End, justifyContent: FlexAlign.SpaceBetween }) {
            Button(this.bModel.getButtonText2(), { type: ButtonType.Normal, stateEffect: true }).borderRadius(5)
              .backgroundColor(this.bModel.getButtonColor())
              .onClick((event: ClickEvent) => {
                this.buttonAction2()
                this.bModel.setShow(Visibility.None)
              })
            Button(this.bModel.getButtonText1(), { type: ButtonType.Normal, stateEffect: true }).borderRadius(5)
              .backgroundColor(this.bModel.getButtonColor())
              .onClick((event: ClickEvent) => {
                this.buttonAction1()
                this.bModel.setShow(Visibility.None)

              })
          }
          .height(50)
          .width('90%')
          .padding({ top: 12, bottom: 8, left: 48 })

        }.width('100%').visibility(this.bModel.getShow())
      }

      else if(this.bModel.getBannerType()==BannerType.ImageButton){
        Column(){
          Flex({ justifyContent: FlexAlign.SpaceBetween }){
            Image(this.image).height(60).width(60).padding({left:10,top:6})
            Column(){
              Text(this.bModel.getBannerMessage())
                .fontSize(this.bModel.getTextSize()).fontFamily(this.bModel.getTextStyle())
                .padding({ top: 10, left: 16 }).width('100%')
            }.height('40vp').width(300)
          }
          Flex({ direction: FlexDirection.RowReverse, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
            Button(this.bModel.getButtonText2(), { type: ButtonType.Normal, stateEffect: true }).borderRadius(5)
              .backgroundColor(this.bModel.getButtonColor())
              .onClick((event: ClickEvent) => {
                this.buttonAction2()
                this.bModel.setShow(Visibility.None)

              })
            Button(this.bModel.getButtonText1(), { type: ButtonType.Normal, stateEffect: true }).borderRadius(5)
              .backgroundColor(this.bModel.getButtonColor())
              .onClick((event: ClickEvent) => {
                this.buttonAction1()
                this.bModel.setShow(Visibility.None)

              })
          }
          .height(50)
          .width('90%')
          .padding({ top: 12, bottom: 8, left: 108 })
        }.width('100%').visibility(this.bModel.getShow())
      }


    }.width('100%')
  }
}
export {BannerModel,BannerType} from './BannerModel'