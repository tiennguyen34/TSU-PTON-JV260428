const original = {
  name: 'Bob',
  age: 30,
  address: {
    city: 'Hà nội',
  },
};
const copy = JSON.parse(JSON.stringify(original));

original.address.city = 'Hải phòng cháy';
copy.name = 'Charlie';
console.log(original);
console.log(copy);