import { FavoriteCard } from '../components/FavoriteCard';
import { SearchBar } from '../components/SearchBar';
import { Favorites } from '../model/Favorites';
import { FavoritesViewModel } from '../viewmodel/FavoritesViewModel';

@Builder
export function FavoritesPageBuilder() {
  FavoritesPage()
}

@Entry
@Component
struct FavoritesPage {
  scroller: Scroller = new Scroller()
  private viewModel: FavoritesViewModel = new FavoritesViewModel();
  searchInput: string = '';
  @State filteredPlacesList: Array<Favorites> = []
  @Consume('mainStack') pathStack: NavPathStack;

  private onSearch(searchInput: string) {
    this.viewModel.setSearchQuery(searchInput)
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  aboutToAppear() {
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  build() {
    NavDestination() {

      Column() {
        SearchBar({
          color: $r('app.color.start_window_background'),
          onSearch: (searchInput: string) => {
            this.onSearch(searchInput)
          },
          placeholder: $r('app.string.search')
        }).padding({ bottom: 3 })

        Scroll(this.scroller) {
          Column() {
            ForEach(this.filteredPlacesList, (menuItem: Favorites) => {
              FavoriteCard({
                placeImage: menuItem.image,
                name: menuItem.name,
                city: menuItem.city
              }).padding({ bottom: 4 })
              Divider().height(2).color(0xCCCCCC).padding({ left: 40, right: 40, bottom: 10 });
            }, (menuItem: Favorites, index: number) => menuItem.name)
          }.padding({ bottom: 25 })
        }.width('100%').height('100%')
      }.backgroundColor(Color.Black).padding({ top: 10, bottom: 10 }).width('100%').height('100%')
    }
    .hideBackButton(true)
  }
}