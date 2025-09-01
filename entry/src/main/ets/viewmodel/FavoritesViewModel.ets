import { dummyFavorites, Favorites } from '../model/Favorites';

@Observed
export class FavoritesViewModel {
  private _restaurantList: Array<Favorites> = dummyFavorites;
  private _filteredPlacesList: Array<Favorites> = dummyFavorites;
  private _searchQuery: string = '';

  getFilteredPlacesList(): Array<Favorites> {
    return this._filteredPlacesList;
  }

  getSearchQuery(): string {
    return this._searchQuery;
  }

  setSearchQuery(query: string): void {
    this._searchQuery = query;
    this._applyFilters();
  }

  private _applyFilters(): void {
    let filteredList = this._restaurantList;
    // Search for place name or city
    if (this._searchQuery.trim() !== '') {
      const query = this._searchQuery.toLowerCase();
      filteredList = filteredList.filter(
        (restaurant) => restaurant.name.toLowerCase().includes(query) || restaurant.city.toLowerCase().includes(query)
      );
    }
    this._filteredPlacesList = filteredList;
  }
}


