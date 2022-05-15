void main() {
  MyApp();
}

MyApp() {
  /* try {
    birFonksiyon(1);
  }
  */ /*catch (hata) {
    // havaya atılan, yakalanan hata!
    //hata ile ilgili ne yapılması gerekiyorsa burada yapılır.
    print(hata + " sı yakalandı");
  }*/ /*
  on ExceptionTypeA {
    // gelen hata ExceptionTypeA tipinde ise bunu yap
    print("A tipi bir hata yakalandı");
  } on ExceptionTypeB {
    print("B tipi bir hata yakalandı");
  } catch (e) {
    print(e);
  }
  //finally hata olsa da olmasa da her türlü durumda bu çalışsın.
   finally {
    print("Her durumda çalışacak Kod Satırı");
  }

  //rethrow yakaladığın hatayı tekrar fırlat. Bir hata yakaladın sende seni çağıran kimse ona fırlat.*/
  try {
    araFonksiyon(1000);
  } catch (e) {
    print("Main fonksiyonu $e hatasını yakaladı");
  }
}

void birFonksiyon(int numara) {
  if (numara < 100) {
    print(numara);
  } /* else if (numara < 1000) {
    throw ExceptionTypeA();
  } else if (numara < 10000) {
    throw ExceptionTypeB();
  }*/
  else {
    throw Exception("Diğer Bir hata oluştu");
  }
}

void araFonksiyon(int numara) {
  try {
    birFonksiyon(numara);
  } catch (e) {
    print("ara fonksiyonu şu hatayı yakaladı: $e");

    rethrow;
  }
}

//network hatası olsun
class ExceptionTypeA implements Exception {}

//authentication hatası olsun
class ExceptionTypeB implements Exception {}

//kullanıcı girişi hataları
//1. network hatası
//2. authentication hatası: Kullanıcı zaten giriş yapmış, bilgileri uyuşmuyor gibi
//bu durumda gelen hatanın ne olduğuna bakıp işlem yapmak gerekiyor
