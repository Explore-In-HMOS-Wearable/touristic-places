@Component
export struct PlacesCardComponent {
  @Prop placeImage: ResourceStr
  @Prop name: string
  @Prop city: string
  @State favImage: ResourceStr = $r('app.media.fav');
  @State isFavorite: boolean = false

  build() {
    Column() {
      Stack() {
        Image(this.placeImage)
          .height(100)
          .width('100.00%')
          .borderRadius(10)
          .objectFit(ImageFit.Cover)
          .padding({ bottom: 5 })
        Image(this.favImage)
          .width(17)
          .height(17)
          .padding({ top: 4, right: 4 })
          .onClick(() => {
            this.isFavorite = !this.isFavorite
            this.favImage = this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav')
          })

      }.alignContent(Alignment.TopEnd)

      Text(this.name).fontSize(11).fontColor(Color.White).padding({ bottom: 2 })
      Text(this.city).fontSize(9).fontColor(Color.White)

    }.padding(2).width('90.00%').borderRadius(20)

  }
}