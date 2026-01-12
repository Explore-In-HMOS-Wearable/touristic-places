import { curves } from '@kit.ArkUI';

@Component
export struct AnimatedText {
  @State opacityValue: number = 0;
  @State translateY: number = -100;

  build() {
    Column() {
      Text($r('app.string.travel_app'))
        .opacity(this.opacityValue)
        .translate({ y: this.translateY })
        .fontSize(30)
        .fontWeight(FontWeight.Bolder)
        .fontColor(Color.White)
        .textShadow({
          radius: 40,
          color: '#ff00fff8',
          offsetX: 0,
          offsetY: 0
        })
        .animation({
          curve: curves.initCurve(),
          iterations: 1,
          duration: 500,
          delay: 500,
          playMode: PlayMode.Alternate
        })
        .onAppear(() => {
          this.opacityValue = 1;
          this.translateY = 0;
        })
    }
    .width('100%')
  }
}
