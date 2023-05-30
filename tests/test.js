const request = require('supertest');
const express = require('express');

const mockData = [
  {
    product_id: 1,
    item_name: 'Camo Onesie',
    slogan: 'Blend in to your crowd',
    product_description: 'The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.',
    category: 'Jackets',
    default_price: 140,
  },
  {
    product_id: 2,
    item_name: 'Bright Future Sunglasses',
    slogan: "You've got to wear shades",
    product_description: "Where you're going you might not need roads, but you definitely need some shades. Give those baby blues a rest and let the future shine bright on these timeless lenses.",
    category: 'Accessories',
    default_price: 69,
  },
  {
    product_id: 3,
    item_name: 'Morning Joggers',
    slogan: 'Make yourself a morning person',
    product_description: "Whether you're a morning person or not.  Whether you're gym bound or not.  Everyone looks good in joggers.",
    category: 'Pants',
    default_price: 40,
  },
  {
    product_id: 4,
    item_name: "Slacker's Slacks",
    slogan: 'Comfortable for everything, or nothing',
    product_description: "I'll tell you how great they are after I nap for a bit.",
    category: 'Pants',
    default_price: 65,
  },
  {
    product_id: 5,
    item_name: 'Heir Force Ones',
    slogan: 'A sneaker dynasty',
    product_description: "Now where da boxes where I keep mine? You should peep mine, maybe once or twice but never three times. I'm just a sneaker pro, I love Pumas and shell toes, but can't nothin compare to a fresh crispy white pearl",
    category: 'Kicks',
    default_price: 99,
  },
];

const app = express();
const routes = require('../server/routes');

app.use('/products', routes);

describe('/products', () => {
  it('Responds with appropriate product datas', async () => {
    const results = await request(app).get('/products');
    expect(results.statusCode).toBe(200);
    expect(results.body).toStrictEqual(mockData);
    expect(results.header['content-type']).toContain('json');
  });
});
