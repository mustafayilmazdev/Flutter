import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> yanitlar = [
    'TIKLA FALIN GELSİN',
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];
  int genelYanit = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            "GÜNÜN FALI",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/falci.png",
                    scale: 2,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  buildFalButon("AŞK DURUMU", Icons.wc, Colors.pink),
                  SizedBox(
                    height: 20,
                  ),
                  buildFalButon(
                      "PARA DURUMU", Icons.monetization_on, Colors.red),
                  SizedBox(
                    height: 20,
                  ),
                  buildFalButon(
                      "GÜNLÜK TAVSİYE", Icons.auto_awesome, Colors.green),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(45, 10, 40, 10),
                      child: Text(
                        yanitlar[genelYanit],
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FlatButton buildFalButon(String ad, IconData avatar, Color renk) {
    return FlatButton(
      onPressed: () {
        setState(() {
          if (ad == "AŞK DURUMU") {
            int yeniYanit = Random().nextInt(5) + 1;

            while (genelYanit == yeniYanit) {
              yeniYanit = Random().nextInt(5) + 1;
            }
            genelYanit = yeniYanit;
          }
          if (ad == "PARA DURUMU") {
            int yeniParaYaniti = Random().nextInt(5) + 6;
            while (genelYanit == yeniParaYaniti) {
              yeniParaYaniti = Random().nextInt(5) + 6;
            }
            genelYanit = yeniParaYaniti;
          }
          if (ad == "GÜNLÜK TAVSİYE") {
            int yeniSaglikYaniti = Random().nextInt(5) + 11;
            while (genelYanit == yeniSaglikYaniti) {
              yeniSaglikYaniti = Random().nextInt(5) + 11;
            }
            genelYanit = yeniSaglikYaniti;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 300,
        child: ListTile(
          leading: Icon(
            avatar,
            size: 40,
            color: renk,
          ),
          title: Text(
            ad,
            style: TextStyle(color: renk),
          ),
        ),
      ),
    );
  }
}
