import 'package:first_app/models/item.dart';
import 'package:flutter/material.dart';

import 'package:first_app/models/category.dart';

const availableCategories = [
  Category(
    id: 'c1',
    title: 'Buy Gold Bars',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Gold Jewelry',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Gold Investments',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Gold Coins',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Gold Savings',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Gold Certificates',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Gold IRA',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Gold Bullion',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Sell Gold',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Gold Market News',
    color: Colors.teal,
  ),
];

const dummyGoldItems = [
  GoldItem(
    id: 'g1',
    categories: [
      'c1',
      'c2',
    ],
    name: 'Gold Bar 1g',
    rarity: 'Common',
    price: 5000,
    weight: 1,
    purity: 99.99,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://images.unsplash.com/photo-1610375461369-d613b564f4c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    description: 'A 1g gold bar with high purity.',
  ),
  GoldItem(
    id: 'g2',
    categories: [
      'c2',
    ],
    name: 'Gold Necklace',
    rarity: 'Common',
    price: 15000,
    weight: 5,
    purity: 92.5,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://images.unsplash.com/photo-1613498510372-8901cad084a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=437&q=80',
    description: 'A beautiful gold necklace with intricate design.',
  ),
  GoldItem(
    id: 'g3',
    categories: [
      'c2',
      'c3',
    ],
    name: 'Gold Investment Coin',
    rarity: 'Rare',
    price: 100000,
    weight: 10,
    purity: 99.9,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://images.unsplash.com/photo-1639803812104-7fe5161508a1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80',
    description: 'A rare gold investment coin for collectors.',
  ),
  GoldItem(
    id: 'g4',
    categories: [
      'c4',
    ],
    name: 'Gold Sovereign',
    rarity: 'Rare',
    price: 20000,
    weight: 7.988,
    purity: 91.67,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://img.freepik.com/free-vector/indian-rupee-coins-background-with-text-space_1017-17452.jpg?w=740&t=st=1692472284~exp=1692472884~hmac=c0ac4373bdcf12fb33fc608a58b5e55efe5a8a36dbc862b152cddf4edaf0137d',
    description: 'An historic gold sovereign coin.',
  ),
  GoldItem(
    id: 'g5',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    name: 'Gold Plated Watch',
    rarity: 'Common',
    price: 8000,
    weight: 0.2,
    purity: 14,
    isCertified: false,
    isHallmarked: false,
    imageURL:
        'https://images.unsplash.com/photo-1651735060244-781017915251?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    description: 'A stylish watch with gold-plated accents.',
  ),
  GoldItem(
    id: 'g6',
    categories: [
      'c6',
      'c10',
    ],
    name: 'Gold Earrings',
    rarity: 'Common',
    price: 6000,
    weight: 0.05,
    purity: 18,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://images.unsplash.com/photo-1588891825655-aa526b56f805?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    description: 'Elegant gold earrings for any occasion.',
  ),
  GoldItem(
    id: 'g7',
    categories: [
      'c7',
    ],
    name: 'Gold Bullion Bar 10g',
    rarity: 'Common',
    price: 45000,
    weight: 10,
    purity: 99.9,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://plus.unsplash.com/premium_photo-1677975647014-09dbc5cfda7c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
    description: 'A 10g gold bullion bar for investment.',
  ),
  GoldItem(
    id: 'g8',
    categories: [
      'c8',
    ],
    name: 'Gold Panda Coin',
    rarity: 'Rare',
    price: 25000,
    weight: 30,
    purity: 99.99,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://img.freepik.com/free-vector/hand-drawn-dogecoin-illustration_23-2149213705.jpg?w=740&t=st=1692472403~exp=1692473003~hmac=df41db869dcef14ce766780f33aeeec190d92786bf5e25ba4397c1d64693e38b',
    description: 'A rare Gold Panda coin with exquisite design.',
  ),
  GoldItem(
    id: 'g9',
    categories: [
      'c9',
    ],
    name: 'Gold Jewelry Set',
    rarity: 'Rare',
    price: 60000,
    weight: 15,
    purity: 95,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://img.freepik.com/free-vector/jewelry-realistic-set_1284-6728.jpg?w=740&t=st=1692472436~exp=1692473036~hmac=2400ebe2b8e584d07955cea09faa0c938a6c76317777cc6ca9ea1ab2c8abe92a',
    description: 'An extravagant gold jewelry set for special occasions.',
  ),
  GoldItem(
    id: 'g10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    name: 'Gold Pocket Watch',
    rarity: 'Legendary',
    price: 120000,
    weight: 0.15,
    purity: 22,
    isCertified: true,
    isHallmarked: true,
    imageURL:
        'https://img.freepik.com/free-vector/vintage-watch-illustration-vector-remixed-from-artwork-by-harry-g-aberdeen_53876-115525.jpg?w=740&t=st=1692472465~exp=1692473065~hmac=fd944fb26a406895cef38adea9ad62f158ac0bbe0b74e248a74e84d974ce831b',
    description: 'A legendary gold pocket watch with intricate craftsmanship.',
  ),
];
