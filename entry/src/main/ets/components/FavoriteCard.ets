import { Favorites } from '../model/Favorites'

@Component
export struct FavoriteCard {
  @Prop placeImage: ResourceStr
  @Prop name: string
  @Prop city: string
  @State favImage: string = '/icons/full_fav.png';
  @State isFavorited: boolean = false;
  @State favorites: Array<Favorites> = [];

  build() {
    Column() {
      Stack() {
        Image(this.placeImage)
          .height(100)
          .width(120)
          .borderRadius(10)
          .objectFit(ImageFit.Cover)
          .padding({ bottom: 5 })
        Image(this.favImage)
          .width(17)
          .height(17)
          .padding({ top: 4, right: 4 })
          .onClick(() => {

            if (this.favImage === '/icons/fav.png') {
              this.favImage = '/icons/full_fav.png';
            } else {
              this.favImage = '/icons/fav.png';
            }
          })

      }.alignContent(Alignment.TopEnd)

      Text(this.name).fontSize(11).fontColor(Color.White).padding({ bottom: 2 })
      Text(this.city).fontSize(9).fontColor(Color.White)

    }.padding(2).width('70%').borderRadius(20)

  }
}