
const PRODUCTS = [
    {
        id: 1,
        name: '商品1',
        price: 1,
        image: require('../assets/Apple.png')
    },

    {
        id: 2,
        name: '商品2',
        price: 2.0,
        image: require('../assets/Banana.png')
    },
    
    {
        id: 3,
        name: '商品3',
        price: 3,
        image: require('../assets/Orange.png')
    },

	{
        id: 4,
        name: '商品4',
        price: 4,
        image: require('../assets/Grapes.png')
    },

	{
        id: 5,
        name: '商品5',
        price: 5,
        image: require('../assets/Strawberry.png')
    },
    
	{
        id: 6,
        name: '商品6',
        price: 6,
        image: require('../assets/Cherry.png')
    }
	
];

export function getProducts() {
    return PRODUCTS;
}

export function getProduct(id) {
    return PRODUCTS.find((product) => (product.id == id));
}
