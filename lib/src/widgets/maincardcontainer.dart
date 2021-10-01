import 'package:flutter/material.dart';

class CardContainerMain extends StatelessWidget {
  const CardContainerMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 16,
            spreadRadius: 0.5,
            offset: Offset(0.5, 0.5),
          ),
        ],
      ),
      child: const _Detalles(),
    );
  }
}

class _Detalles extends StatelessWidget {
  const _Detalles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6.0),
          const Text(
            'Hola Luis,',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const Text(
            '¿Donde Vas?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 6,
                  spreadRadius: 0.5,
                  offset: Offset(0.5, 0.5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.indigo,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '¿Donde Quieres ir?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Icons.home,
                color: Colors.grey,
                size: 30,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Tu Ubicacion actual',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
