export interface Places {
  name: string;
  image: Resource;
  city: string;
}

export const dummyPlaces: Places[] = [
  {
    name: 'Efes Antik Kenti',
    image: $r('app.media.efes'),
    city: 'Izmir',
  },
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
    name: 'Nemrut Dagi',
    image: $r('app.media.nemrut'),
    city: 'Adiyaman'
  },
  {
    name: 'Pamukkale Travertenleri',
    image: $r('app.media.pamukkale'),
    city: 'Denizli',
  },
  {
    name: 'Kiz Kulesi',
    image: $r('app.media.kizkulesi'),
    city: 'Istanbul'
  }

]