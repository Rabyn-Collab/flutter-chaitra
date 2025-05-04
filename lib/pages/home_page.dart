import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/data/books.dart';
import 'package:flutter_chaitra/pages/widgets/book_slider.dart';
import 'package:go_router/go_router.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF1F5F9),
        title: Text('Hi John,', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search)),
          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell)),
        ],
      ),
      body: ListView(
        children: [


          Image.network('https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGJvb2t8ZW58MHx8MHx8fDA%3D',
          height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

         SizedBox(height: 20,),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index){
              final book = bookList[index];
                return BookSlider(book: book,);
              }
          ),
        ),

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Text('You may also like', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index){
                  return SizedBox(width: 10,);
                },
                  scrollDirection: Axis.horizontal,
                  itemCount: bookList.length,
                  itemBuilder: (context, index){
                    final book = bookList[index];
                    return InkWell(
                      onTap: (){
                        context.push('/grid-page');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network('https://plus.unsplash.com/premium_photo-1686000531905-73dde137bc91?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
                            height: 200,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(book.title),
                          Text(book.genre, style: TextStyle(color: Colors.teal),)
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),





        ],
      ),
    );
  }
}
