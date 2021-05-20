import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product_model.dart';
import 'package:flutter_shop/utils/app_bar.dart';
import 'package:flutter_shop/utils/constants.dart';
import 'package:flutter_shop/utils/theme.dart';
import 'package:flutter_svg/svg.dart';

class DetailWidget extends StatefulWidget {
  final ProductModel product;
  const DetailWidget({Key key, this.product}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  int numOfItems = 1;
  bool _buyed = false;
  bool _isFavorite = false;
  int _selectedColor = 1;

  Padding _buildAddCart(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              color: _buyed ? widget.product.color : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: widget.product.color,
              ),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: _buyed ? Colors.white : widget.product.color,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: widget.product.color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                onPressed: () {
                  setState(() {
                    _buyed = !_buyed;
                  });
                },
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildProductTitle(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: kDefaultPadding),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Price\n"),
                      TextSpan(
                        text: "\$${product.price}",
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Padding _buildDescription(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }

  GestureDetector _buildFavoriteButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: _isFavorite ? Color(0xFFFF6464) : Color(0xFFE8E8E8),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset("assets/icons/heart.svg"),
      ),
    );
  }

  Row _buildCounterFavoriteRow(ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildCartCounter(product),
        _buildFavoriteButton(),
      ],
    );
  }

  Row _buildColors(ProductModel product) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 1;
                      });
                    },
                    child: ColorDot(
                      color: widget.product.color,
                      isSelected: _selectedColor == 1 ? true : false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 2;
                      });
                    },
                    child: ColorDot(
                      color: Color(0xFFF8C078),
                      isSelected: _selectedColor == 2 ? true : false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = 3;
                      });
                    },
                    child: ColorDot(
                      color: Color(0xFFCFCFCF),
                      isSelected: _selectedColor == 3 ? true : false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${widget.product.size} cm",
                  style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildCounter({Function press, IconData icon, ProductModel product}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: product.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  Row _buildCartCounter(ProductModel product) {
    return Row(
      children: <Widget>[
        _buildCounter(
          product: product,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        _buildCounter(
          product: product,
          press: () {
            setState(() {
              numOfItems++;
            });
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: CustomAppBar(
        barColor: widget.product.color,
        textColor: Colors.white,
        visible: true,
        context: context,
      ).get(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.15,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        _buildColors(widget.product),
                        SizedBox(height: kDefaultPadding / 2),
                        _buildDescription(widget.product),
                        SizedBox(height: kDefaultPadding / 2),
                        _buildCounterFavoriteRow(widget.product),
                        SizedBox(height: kDefaultPadding / 2),
                        _buildAddCart(widget.product)
                      ],
                    ),
                  ),
                  _buildProductTitle(widget.product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
