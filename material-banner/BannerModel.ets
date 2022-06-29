export enum BannerType{
  OneButton,
  TwoButton,
  ImageButton
}

export class BannerModel{
  private bannerType:BannerType;
  private bannerMessage:string;
  private buttonText1:string;
  private buttonText2:string;
  private buttonColor:string|ResourceColor="#317AFF";
  private textSize:number=20;
  private textStyle:string="calibri";
  private show:Visibility=Visibility.Visible;

  constructor(value:BannerType){
    this.bannerType=value
  }

  getBannerType(): BannerType{
    return this.bannerType
  }

  getButtonColor():string|ResourceColor{
    return this.buttonColor
  }
  getTextSize():number{
    return this.textSize
  }
  getTextStyle():string{
    return this.textStyle
  }
  getBannerMessage():string{
    return this.bannerMessage
  }
  getButtonText1():string{
    return this.buttonText1
  }
  getButtonText2():string{
    return this.buttonText2
  }
  getShow(): Visibility{
    return this.show
  }

  setButtonColor(value:string|ResourceColor):BannerModel{
    if(value==null || value==undefined){
      console.log("Button color not set. Default value used")
    }
    this.buttonColor=value
    return this
  }
  setTextSize(tc:number):BannerModel{
    if(tc==null || tc==undefined){
      console.log("Text size not set. Default value used")
    }
    this.textSize=tc
    return this
  }
  setTextStyle(ts:string):BannerModel{
    if(ts==null || ts==undefined){
      console.log("Text style not set. Default value used")
    }
    this.textStyle=ts
    return this
  }
  setBannerMessage(s:string):BannerModel{
    this.bannerMessage=s
    return this
  }
  setButtonText1(a1:string):BannerModel{
    this.buttonText1=a1
    return this
  }
  setButtonText2(a2:string):BannerModel{
    this.buttonText2=a2
    return this
  }
  setShow(value: Visibility): BannerModel{
    this.show = value
    return this
  }
}