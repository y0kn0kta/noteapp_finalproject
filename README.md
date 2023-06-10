# Note App
## main.dart
İlk önce terminalden kütüphanelerimi kurdum:
* firebase_core: Fire base işlemleri için.
* cloud_firestore: Fire base veri tabanı için.
* google_fonts: Yazı stilleri için.

Dosyalarımı içe aktardım:
* firebase_core/firebase_core.dartt: Fire base.
* flutter/material.dart: Widgetler.
* home_screen.dart: Oluşturduğum ana sayfa.

Burası uygulama başlatıcısı. 
* *await Firebase.initializeApp()* komutuyla fire base başlattım ve ana ekran olarak home_screen dosyasını belirledim.
## home_screen.dart
Burası ana sayfam.
* Oluşturduğum bütün dosyaları içe aktardım. 
* Arayüz için Scaffold döndürdüm. 
* Arka planımı oluşturduğum AppStyle dosyasından mainColor fonksiyonundan çekiyor.
* Üst kısım için appBar oluşturdum. Gölgelendirmeyi kapattım.Başlığımı verdim, ortaladım, rengini belirledim.
* body bölümünde iç kenar boşluklarını EdgeInsets.all ile eşit olarak ayarladım.
* "Your recent Notes" yazdım. Yazı stilini roboto olarak belirledim. Rengini beyaz seçtim. Kalınlığını ayarladım.
* Expanded ile kullanılabilir alan sağladım. 
* StreamBuilder<QuerySnapshot>: **StreamBuilder** ile **QuerySnapshot**(Fire store veri tabanı) dinledim.
* *stream: FirebaseFirestore.instance.collection("Notes").snapshots* kodunda veri tabanındaki "notes" kısmı için akış oluşturdum. 
* *if (snapshot.hasData)* sorgusunda verinin varlığını kontrol ettim.
* GridView ile notlarımı ızgara şeklinde gösterdim.
* crossAxisCount değerine 2 dedim. Yani bir sırada iki ızgara gözükecek.
* *children: snapshot.data!.docs.map((note) => noteCard(()* burada önce firesore'dan gelen belgelerin listesine erişip, GridView'e ekledim. Sonra "note" ögesi içinde "noteCard" oluşturdum. 
*  *Navigator.push(context,MaterialPageRoute(builder: (context) =>NoteReaderScreen(note)));* bu kodda ise oluşturduğum NoteReaderScreen sayfasına yönlendiriyorum.
* Veri tabanında notes bölümünde bir şey yok ise "there's no Notes" yazısı çıkacak.
* En altta da "Add Note" yazan bir buton oluşturdum. Tıklayınca oluşturduğum NoteEditorScreen sayfasına yönlendiriyor.
## app_style.dart
Burada uygulamanın rengi, yazı stilleri vb olan kısımları bulunur.
* bgColor (arka plan), mainColor (ana tema), accentColor(vurgu rengi) adında üç tane fonksiyon oluşturdum.
* cardColor adında liste oluşturdum. İçine renkleri atadım. Diğer dosylarımda buradan rastgele çağıracağım.
* Son olarak mainTitle(başlık), mainContent(içerik), dateTitle(tarih) adında üç fonksiyon oluşturdum. Bunların yazı stillerini belirledim.
## note_card.dart
Burada notların yazılacağı kartlar oluşturuluyor.
* *Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc)* en üstte şöyle bir Widget oluşturdum. Burada iki parametre bulunuyor.
  * onTap: Tıklama işlevini verir.
  * doc: Veri tabanından veri çeker.
* InkWell ile tıklanabilir alan oluşturdum.
* padding ve margin değerlerini verdim.
* BorderRadius ile köşeleri yuvarladım.
* AppStyle dosyasından kart rengini, başlık özelliklerini, içerik özelliklerini ve tarih özelliklerini verdim.
* *overflow: TextOverflow.ellipsis,* kodu sayesinde ana sayfada notun bir kısmını gösterip devamına "..." koydum.
## note_editor.dart
Burada not yazma işlemi gerçekleşir.
* Öncelikle rastgele bir renk aldım.
* *String date = DateTime.now().toString();* koduyla mevcut zamanı aldım.
* TextEditingController() ve TextEditingController() adında iki adet controller oluşturdum. Bunları alt tarafta veri tabanına not eklerken kullacağım.
* Renklerini verdikten sonra ikonların siyah olmasını belirttim.
* Sayfanın başına "Add a new Note" yazısı ekledim. 
* Metni yazarken çerçeve çıkmasını önledim.
* hintText sayesinde sayfa ilk açıldığında başlık ve içerik olmayacağı için gerekli bölümlere "Note Title" ve "Note Content" yazısı yazdırdım.
* Sayfamın altına kaydet butonu verdim. onTap ile dokunulabilir kıldım. Butona tıklayınca yukarıda oluşturduğum controller sayesinde veri tabanında notes kısmına eklenecek ve Navigator.pop sayesinde geldiğim sayfaya tekrardan yönlendirecek.
## note_reader.dart
Burası notların okunduğu bölüm.
* Veri tabanına kaydedilmiş notları getirmek için doc kullandım.
* widget.doc["note_title"], widget.doc["cretion_date"], widget.doc["note_content"] kodlarıyla veri tabanındaki notların ilgili bölümlerini önüme getirmeyi sağladım.
