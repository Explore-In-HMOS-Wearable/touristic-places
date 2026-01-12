import { curves } from '@kit.ArkUI';
import { AnimatedText } from '../components/AnimatedText';

@Entry
@Component
struct SplashPage {
  @Provide('mainStack') pathStack: NavPathStack = new NavPathStack()
  private timerId = 0;
  @State planeOffsetX: number = -400;
  @State planeOffsetY: number = 350;
  animateEarth: boolean = false;
  @State earthTranslateY: number = 300;

  aboutToAppear() {
    setTimeout(() => {
      this.startPlaneAnimation();
    }, 100);

    this.timerId = setTimeout(() => {
      this.pathStack.pushPath({
        name: 'HomePage'
      });
    }, 5000);
  }

  startPlaneAnimation() {
    this.getUIContext().animateTo({
      curve: curves.initCurve(),
      duration: 4500,
      delay: 0,
      iterations: 1,
      playMode: PlayMode.Normal
    }, () => {
      this.planeOffsetX = 500;
      this.planeOffsetY = -150;
    });
  }

  onDestroy() {
    if (this.timerId) {
      clearTimeout(this.timerId);
    }
  }

  build() {
    Navigation(this.pathStack) {

      Stack() {
        Column() {
          Image($rawfile('ic_splash_earth.png'))
            .width(80)
            .translate({ y: this.earthTranslateY })
            .height(80)
            .animation({
              curve: curves.initCurve(),
              iterations: 1,
              duration: 500,
              playMode: PlayMode.Alternate
            })
            .onAppear(() => {
              this.earthTranslateY = 20;
            })
        }
        .height('100%')
        .width('100%')
        .justifyContent(FlexAlign.Center)

        AnimatedText()
          .position({
            y: 60
          })
        Image($rawfile('ic_splash_plane.png'))
          .width(100)
          .height(100)
          .position({ x: this.planeOffsetX, y: this.planeOffsetY })
          .rotate({ angle: -30 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
    }
    .hideTitleBar(true)
  }
}