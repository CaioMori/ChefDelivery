//
//  DataSourceMock.swift
//  ChefDelivery
//
//  Created by Caio Mori on 24/11/24.
//

import Foundation

let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "Restaurantes", image: "hamburguer"),
    OrderType(id: 2, name: "Mercado", image: "mercado"),
    OrderType(id: 3, name: "Farmácia", image: "farmacia"),
    OrderType(id: 4, name: "Pet", image: "petshop"),
    OrderType(id: 5, name: "Descontos", image: "descontos"),
    OrderType(id: 6, name: "Bebidas", image: "bebidas"),
    OrderType(id: 7, name: "Gourmet", image: "gourmet"),
]

let storesMock: [StoreType] = [
    StoreType(id: 1, name: "Monstro Burger", logoImage: "monstro-burger-logo", headerImage: "monstro-burger-header", location: "Rua Principal, 123, São Paulo, SP", rating: 4, products: [
        ProductType(id: 1, name: "Hambúrguer Clássico", description: "Hambúrguer de carne com queijo, alface e tomate", image: "classic_burger", price: 14.99),
        ProductType(id: 2, name: "Hambúrguer com Bacon", description: "Hambúrguer de carne com queijo, bacon crocante, alface e tomate", image: "bacon_burger", price: 16.99),
    ProductType(id: 3, name: "Batatas Fritas", description: "Porção de batatas fritas crocantes", image: "fries", price: 5.99), ProductType(id: 4, name: "Refrigerante", description: "Lata de refrigerante de 355ml", image: "soda", price: 3.99),
    ProductType(id: 5, name: "Sorvete de Baunilha", description: "Copo de sorvete de baunilha", image: "vanilla_ice_cream", price: 4.99), ]),]
