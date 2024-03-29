import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '1s', target: 100 },
    { duration: '28s', target: 1000 },
    { duration: '1s', target: 0 },
  ],
};

export default function () {
  // const randomProductId = Math.floor(900000 + Math.random() * 100000);
  const res = http.get('http://localhost:3000/api/products');
  check(res, { 'status was 200': (r) => r.status == 200 });
  // sleep(1);
}
