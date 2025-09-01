export interface Favorites {
  name: string;
  image: Resource;
  city: string;
}

export const dummyFavorites: Favorites[] = [
  {
    name: 'Li River',
    image: $r('app.media.liriver'),
    city: 'Guilin'
  },
  {
    name: 'Ölüdeniz',
    image: $r('app.media.oludeniz'),
    city: 'Fethiye',
  },
  {
    name: 'Kiz Kulesi',
    image: $r('app.media.kizkulesi'),
    city: 'Istanbul'
  }

]