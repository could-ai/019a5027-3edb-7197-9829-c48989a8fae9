import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio 45 Dias Até Dezembro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF0000), // Red
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(blurRadius: 10, color: Color(0xFFFFD700))]),
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700), // Gold
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            HowItWorksSection(),
            RealTransformationsSection(),
            CountdownSection(),
            SignUpFormSection(),
            PremiumSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1581009137042-c552e485697a?fit=crop&w=1950&q=80'), // Placeholder image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '🔥 EMAGREÇA EM 45 DIAS ATÉ DEZEMBRO 🔥',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: MediaQuery.of(context).size.width > 600 ? 52 : 36),
              ),
              const SizedBox(height: 20),
              Text(
                'O desafio que vai transformar seu corpo e sua confiança!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Quero entrar no desafio agora!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: Colors.black,
      child: Column(
        children: [
          Text('Como Funciona o Desafio?', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 40),
          const Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              PillarWidget(icon: '🥗', title: 'Alimentação Equilibrada', description: 'Planos alimentares simples e deliciosos para queimar gordura.'),
              PillarWidget(icon: '💪', title: 'Treinos de 20-30 Min', description: 'Exercícios rápidos e intensos que você pode fazer em casa.'),
              PillarWidget(icon: '🔥', title: 'Motivação Diária', description: 'Apoio contínuo para manter você no foco total.'),
            ],
          )
        ],
      ),
    );
  }
}

class PillarWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const PillarWidget({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 50)),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class RealTransformationsSection extends StatelessWidget {
  const RealTransformationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: const Color(0xFF111111),
      child: Column(
        children: [
          Text('Transformações Reais', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          Text(
            '“Em 45 dias, você pode ter o corpo que vai orgulhosamente mostrar no Réveillon!”',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: const Color(0xFFFFD700), fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 40),
          const Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              TransformationCard(before: 'Antes', after: 'Depois'),
              TransformationCard(before: 'Antes', after: 'Depois'),
              TransformationCard(before: 'Antes', after: 'Depois'),
            ],
          )
        ],
      ),
    );
  }
}

class TransformationCard extends StatelessWidget {
  final String before;
  final String after;

  const TransformationCard({super.key, required this.before, required this.after});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 150, height: 200, color: Colors.grey[800], child: Center(child: Text(before))),
            const SizedBox(width: 10),
            Container(width: 150, height: 200, color: Colors.grey[700], child: Center(child: Text(after))),
          ],
        ),
        const SizedBox(height: 10),
        const Text('"O desafio mudou minha vida!" - Joana', style: TextStyle(fontStyle: FontStyle.italic))
      ],
    );
  }
}

class CountdownSection extends StatefulWidget {
  const CountdownSection({super.key});

  @override
  State<CountdownSection> createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  late Timer _timer;
  Duration _timeUntilDecember = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _calculateTime());
  }

  void _calculateTime() {
    final now = DateTime.now();
    final decemberFirst = DateTime(now.year, 12, 1);
    setState(() {
      _timeUntilDecember = decemberFirst.isAfter(now) ? decemberFirst.difference(now) : const Duration();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: Colors.black,
      child: Column(
        children: [
          Text(
            'O tempo está passando. Comece hoje — ainda dá tempo!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.red),
          ),
          const SizedBox(height: 20),
          Text(
            '${_timeUntilDecember.inDays}d : ${_timeUntilDecember.inHours.remainder(24)}h : ${_timeUntilDecember.inMinutes.remainder(60)}m : ${_timeUntilDecember.inSeconds.remainder(60)}s',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(color: const Color(0xFFFFD700)),
          ),
          const SizedBox(height: 10),
          const Text('Até 1º de Dezembro!', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: const Color(0xFF111111),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              Text('Você está a um passo da sua melhor versão.', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text('Inscreva-se e comece o desafio agora!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: const Color(0xFFFFD700))),
              const SizedBox(height: 30),
              const TextField(decoration: InputDecoration(labelText: 'Nome', border: OutlineInputBorder())),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: 'WhatsApp', border: OutlineInputBorder())),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder())),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('INSCREVER AGORA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumSection extends StatelessWidget {
  const PremiumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text('Quer Resultados Ainda Mais Rápidos?', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: const Color(0xFFFFD700))),
              const SizedBox(height: 20),
              const Text(
                'Nosso Plano Premium oferece acompanhamento individual, um grupo exclusivo no WhatsApp e dicas diárias para acelerar sua transformação.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Quero o plano completo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      color: const Color(0xFF111111),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)), // Placeholder for Instagram
              IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble)), // Placeholder for WhatsApp
            ],
          ),
          const SizedBox(height: 20),
          const Text('© 2024 Desafio 45 Dias. Todos os direitos reservados.'),
        ],
      ),
    );
  }
}
