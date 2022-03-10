// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

contract EcellShop{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    struct Product{
        uint id;
        string name;
        uint price;
        uint quantity;
        string description;
        string image;
        string category;
        bool isActive;
    }

    struct ordersPlaced {
        uint productId;
        uint purchaseId;
        address orderedBy;
        string deliveryAddress;
        uint quantity;
    }
    
    struct user{
        string name;
        string email;
        // address userAddress;
    }

    // struct shipment{
    //     uint purchaseId;
    //     address shippedBy;
    //     string status;
    // }


    mapping (uint => Product) products;
    Product[] public productList;

    mapping (address => ordersPlaced[]) orders;

    mapping (address => user) users;

    function createAccount(string memory _name, string memory _email) public{
        user memory newUser;
        newUser.name = _name;
        newUser.email = _email;
        // newUser.userAddress = _userAddress;
        users[msg.sender] = newUser;
    }

    function addProduct (uint productID, string memory _name, uint _price, uint _quantity, string memory _description, string memory _image, string memory _category) public{
        require(!products[productID].isActive);
        Product memory product = Product(productID, _name, _price, _quantity, _description, _image, _category, true);
        productList.push(product);
        products[productID].id = productID;
        products[productID].name = _name;
        products[productID].price = _price;
        products[productID].quantity = _quantity;
        products[productID].description = _description;
        products[productID].image = _image;
        products[productID].category = _category;
        productList[product.id] = product;
        
    }

    function getOrdersPlaced(uint _index) public view returns (uint, uint, address){
        return (orders[msg.sender][_index].productId,
        orders[msg.sender][_index].purchaseId,
        orders[msg.sender][_index].orderedBy);
    }

}