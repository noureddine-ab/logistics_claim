import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const LogisticsApp());
}

class LogisticsApp extends StatelessWidget {
  const LogisticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTN Logistics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Screen with Client/Agent Selection
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF42A5F5)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ctn_logo.png', height: 150),
              const SizedBox(height: 40),
              const Text(
                'Bienvenue chez CTN Logistics',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Simplifiez vos réclamations, suivez vos livraisons',
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // In the WelcomeScreen class, update the Client button onPressed method:
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClientLoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Espace Client',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AgentLoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Espace Agent',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Service client disponible 24/7\nHotline: 70 100 100',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add this code to your existing app, before the HomeScreen class

class ClientLoginScreen extends StatefulWidget {
  const ClientLoginScreen({super.key});

  @override
  State<ClientLoginScreen> createState() => _ClientLoginScreenState();
}

class _ClientLoginScreenState extends State<ClientLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion Client'),
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2), Color(0xFF42A5F5)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/ctn_logo.png', height: 120),
                const SizedBox(height: 30),
                const Text(
                  'Espace Client CTN',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Accédez à vos réclamations et suivez vos livraisons',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Mot de passe',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text('Se souvenir de moi'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                // Forgot password functionality
                                _showForgotPasswordDialog(context);
                              },
                              child: const Text('Mot de passe oublié?'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Direct navigation without validation
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0D47A1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Se connecter',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text(
                          'Vous n\'avez pas de compte?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            _showRegistrationDialog(context);
                          },
                          child: const Text('Créer un compte'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Service client disponible 24/7\nHotline: 70 100 100',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mot de passe oublié'),
          content: const Text(
            'Fonctionnalité de démonstration. En production, cela enverrait un email de réinitialisation.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Création de compte'),
          content: const Text(
            'Pour créer un compte client, veuillez contacter notre service commercial au 70 100 100 ou envoyez un email à commercial@ctn.tn',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}

// CLIENT SECTION - Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const NewClaimPage(),
    const TrackClaimPage(),
    const ClientSpacePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Client'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Réclamation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Suivi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Espace Client',
          ),
        ],
      ),
    );
  }
}

// CLIENT SECTION - Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset('assets/ctn_logo.png', height: 120),
          const SizedBox(height: 20),
          const Text(
            'Simplifiez vos réclamations, suivez vos livraisons',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              _buildFeatureCard(
                context,
                Icons.add_circle,
                'Passer une réclamation',
                Colors.blue,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewClaimPage(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                context,
                Icons.track_changes,
                'Suivre une réclamation',
                Colors.green,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackClaimPage(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                context,
                Icons.history,
                'Historique',
                Colors.orange,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClientSpacePage(),
                    ),
                  );
                },
              ),
              _buildFeatureCard(
                context,
                Icons.help,
                'Aide & Contact',
                Colors.purple,
                () {
                  _showHelpDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Service client disponible 24/7\nHotline: 70 100 100',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aide & Contact'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hotline CTN: 70 100 100'),
              SizedBox(height: 10),
              Text('Email: support@ctn.tn'),
              SizedBox(height: 10),
              Text('Chatbot disponible 24/7'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}

// CLIENT SECTION - New Claim Page
class NewClaimPage extends StatefulWidget {
  const NewClaimPage({super.key});

  @override
  State<NewClaimPage> createState() => _NewClaimPageState();
}

class _NewClaimPageState extends State<NewClaimPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedClaimType = 'Retard de livraison';
  final TextEditingController _containerController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> _claimTypes = [
    'Retard de livraison',
    'Dommages aux marchandises',
    'Erreurs administratives',
    'Mise à quai non conforme',
    'Autre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle Réclamation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Type de réclamation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: _selectedClaimType,
                items:
                    _claimTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedClaimType = newValue!;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _containerController,
                decoration: const InputDecoration(
                  labelText: 'Référence du conteneur / connaissement',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir la référence';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date de livraison prévue',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description du problème',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez décrire le problème';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Ajouter des photos/documents',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_a_photo, size: 40),
                    onPressed: () {
                      // Implement photo addition
                    },
                  ),
                  const Text('Ajouter une photo'),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitClaim();
                    }
                  },
                  child: const Text(
                    'Soumettre la réclamation',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _submitClaim() {
    // Implement claim submission logic
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Réclamation soumise'),
          content: const Text(
            'Votre réclamation a été enregistrée avec succès. Vous recevrez un SMS de confirmation.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// CLIENT SECTION - Track Claim Page
class TrackClaimPage extends StatefulWidget {
  const TrackClaimPage({super.key});

  @override
  State<TrackClaimPage> createState() => _TrackClaimPageState();
}

class _TrackClaimPageState extends State<TrackClaimPage> {
  final TextEditingController _claimIdController = TextEditingController();
  final List<Claim> _claims = [
    Claim(
      id: '2025-R0341',
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Résolu',
      containerId: 'CTN-78945',
      issue: 'Retard de livraison',
      description: 'Conteneur destiné à Rades arrivé avec 5 jours de retard',
      resolution: 'Explication fournie + compensation proposée',
    ),
    Claim(
      id: '2025-R0289',
      date: DateTime.now().subtract(const Duration(days: 10)),
      status: 'En traitement',
      containerId: 'CTN-12367',
      issue: 'Dommages aux marchandises',
      description: 'Colis arrivé avec des signes de dommage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suivi de Réclamation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _claimIdController,
              decoration: InputDecoration(
                labelText: 'Numéro de réclamation',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'OU',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Consulter vos réclamations récentes',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ..._claims.map((claim) => _buildClaimCard(claim, context)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildClaimCard(Claim claim, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text('Référence: ${claim.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Conteneur: ${claim.containerId}'),
            Text('Statut: ${claim.status}'),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClaimDetailScreen(claim: claim),
            ),
          );
        },
      ),
    );
  }
}

// CLIENT SECTION - Client Space Page
class ClientSpacePage extends StatefulWidget {
  const ClientSpacePage({super.key});

  @override
  State<ClientSpacePage> createState() => _ClientSpacePageState();
}

class _ClientSpacePageState extends State<ClientSpacePage> {
  final List<Claim> _claims = [
    Claim(
      id: '2025-R0341',
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Résolu',
      containerId: 'CTN-78945',
      issue: 'Retard de livraison',
      description: 'Conteneur destiné à Rades arrivé avec 5 jours de retard',
      resolution: 'Explication fournie + compensation proposée',
      rating: 4.5,
    ),
    Claim(
      id: '2025-R0289',
      date: DateTime.now().subtract(const Duration(days: 10)),
      status: 'En traitement',
      containerId: 'CTN-12367',
      issue: 'Dommages aux marchandises',
      description: 'Colis arrivé avec des signes de dommage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Espace Client')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vos réclamations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ..._claims.map((claim) => _buildClaimCard(claim)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildClaimCard(Claim claim) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Référence: ${claim.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(claim.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    claim.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Conteneur: ${claim.containerId}'),
            Text('Problème: ${claim.issue}'),
            Text('Date: ${DateFormat('dd/MM/yyyy').format(claim.date)}'),
            if (claim.rating != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Satisfaction: '),
                  _buildRatingStars(claim.rating!),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.round() ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Résolu':
        return Colors.green;
      case 'En traitement':
        return Colors.orange;
      case 'En cours d\'analyse':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

// CLIENT SECTION - Claim Detail Screen
class ClaimDetailScreen extends StatelessWidget {
  final Claim claim;

  const ClaimDetailScreen({super.key, required this.claim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails Réclamation ${claim.id}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Référence', claim.id),
            _buildDetailRow('Conteneur', claim.containerId),
            _buildDetailRow('Problème', claim.issue),
            _buildDetailRow(
              'Date',
              DateFormat('dd/MM/yyyy').format(claim.date),
            ),
            _buildDetailRow('Statut', claim.status),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(claim.description),
            if (claim.resolution != null) ...[
              const SizedBox(height: 20),
              const Text(
                'Résolution',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(claim.resolution!),
            ],
            const SizedBox(height: 30),
            const Text(
              'Timeline du traitement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTimeline(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineStep(
          'Réception',
          true,
          DateTime.now().subtract(const Duration(days: 3)),
        ),
        _buildTimelineStep(
          'En cours d\'analyse',
          true,
          DateTime.now().subtract(const Duration(days: 2)),
        ),
        _buildTimelineStep(
          'En traitement',
          true,
          DateTime.now().subtract(const Duration(days: 1)),
        ),
        _buildTimelineStep('Résolu', true, DateTime.now()),
      ],
    );
  }

  Widget _buildTimelineStep(String step, bool completed, DateTime date) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: completed ? Colors.green : Colors.grey,
          ),
          child:
              completed
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text('$step - ${DateFormat('dd/MM/yyyy HH:mm').format(date)}'),
        ),
      ],
    );
  }
}

// CLIENT SECTION - Claim Model
class Claim {
  final String id;
  final DateTime date;
  final String status;
  final String containerId;
  final String issue;
  final String description;
  final String? resolution;
  final double? rating;

  Claim({
    required this.id,
    required this.date,
    required this.status,
    required this.containerId,
    required this.issue,
    required this.description,
    this.resolution,
    this.rating,
  });
}

// AGENT SECTION - Login Screen
class AgentLoginScreen extends StatefulWidget {
  const AgentLoginScreen({super.key});

  @override
  State<AgentLoginScreen> createState() => _AgentLoginScreenState();
}

class _AgentLoginScreenState extends State<AgentLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion Agent CTN'),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ctn_logo.png', height: 100),
              const SizedBox(height: 30),
              const Text(
                'Espace Agent CTN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Matricule / Email professionnel',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre identifiant';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // For demo purposes, just navigate to dashboard
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgentDashboardScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                  ),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AGENT SECTION - Dashboard Screen
class AgentDashboardScreen extends StatefulWidget {
  const AgentDashboardScreen({super.key});

  @override
  State<AgentDashboardScreen> createState() => _AgentDashboardScreenState();
}

class _AgentDashboardScreenState extends State<AgentDashboardScreen> {
  final List<AgentClaim> _claims = [
    AgentClaim(
      id: '2025-R0341',
      clientName: 'Mme Leïla Gharbi',
      claimType: 'Retard de livraison',
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: 'En cours',
      containerId: 'CTN-78945',
      description: 'Conteneur destiné à Rades arrivé avec 5 jours de retard',
      contactInfo: 'leila.gharbi@example.com | +216 12 345 678',
      remainingHours: 24,
    ),
    AgentClaim(
      id: '2025-R0289',
      clientName: 'Société X',
      claimType: 'Dommages aux marchandises',
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Nouveau',
      containerId: 'CTN-12367',
      description: 'Colis arrivé avec des signes de dommage',
      contactInfo: 'contact@societex.tn | +216 98 765 432',
      remainingHours: 48,
    ),
    AgentClaim(
      id: '2025-R0290',
      clientName: 'Société Y',
      claimType: 'Perte de marchandise',
      date: DateTime.now().subtract(const Duration(days: 3)),
      status: 'Résolu',
      containerId: 'CTN-45678',
      description: '2 cartons manquants sur 10',
      contactInfo: 'directeur@societey.tn | +216 55 555 555',
      remainingHours: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord Agent'),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Statistics Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Réclamations', '12', Colors.blue),
                _buildStatCard('En cours', '5', Colors.orange),
                _buildStatCard('Résolues', '7', Colors.green),
              ],
            ),
          ),
          // Claims List
          Expanded(
            child: ListView.builder(
              itemCount: _claims.length,
              itemBuilder: (context, index) {
                return _buildClaimCard(_claims[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildClaimCard(AgentClaim claim) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Réf: ${claim.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(claim.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    claim.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Client: ${claim.clientName}'),
            Text('Type: ${claim.claimType}'),
            Text('Date: ${DateFormat('dd/MM/yyyy').format(claim.date)}'),
            if (claim.status != 'Résolu')
              Text(
                'Délai restant: ${claim.remainingHours}h',
                style: TextStyle(
                  color: claim.remainingHours < 12 ? Colors.red : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AgentClaimDetailScreen(claim: claim),
                      ),
                    );
                  },
                  icon: const Icon(Icons.visibility, size: 16),
                  label: const Text('Détails'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement contact functionality
                    _showContactOptions(context, claim);
                  },
                  icon: const Icon(Icons.phone, size: 16),
                  label: const Text('Contacter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement close claim functionality
                    _closeClaim(claim);
                  },
                  icon: const Icon(Icons.check, size: 16),
                  label: const Text('Clôturer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showContactOptions(BuildContext context, AgentClaim claim) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contacter le client'),
          content: Text(
            'Comment souhaitez-vous contacter ${claim.clientName}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Implement call functionality
              },
              child: const Text('Appeler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Implement email functionality
              },
              child: const Text('Envoyer un email'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  void _closeClaim(AgentClaim claim) {
    setState(() {
      claim.status = 'Résolu';
      claim.remainingHours = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Réclamation ${claim.id} clôturée avec succès')),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Nouveau':
        return Colors.blue;
      case 'En cours':
        return Colors.orange;
      case 'Résolu':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

// AGENT SECTION - Claim Detail Screen
class AgentClaimDetailScreen extends StatefulWidget {
  final AgentClaim claim;

  const AgentClaimDetailScreen({super.key, required this.claim});

  @override
  State<AgentClaimDetailScreen> createState() => _AgentClaimDetailScreenState();
}

class _AgentClaimDetailScreenState extends State<AgentClaimDetailScreen> {
  String? _selectedService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails Réclamation ${widget.claim.id}'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Client Information
            const Text(
              'Informations client',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nom: ${widget.claim.clientName}'),
                    Text('Contact: ${widget.claim.contactInfo}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Claim Information
            const Text(
              'Informations réclamation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type: ${widget.claim.claimType}'),
                    Text('Conteneur: ${widget.claim.containerId}'),
                    Text(
                      'Date: ${DateFormat('dd/MM/yyyy').format(widget.claim.date)}',
                    ),
                    Text('Statut: ${widget.claim.status}'),
                    if (widget.claim.remainingHours > 0)
                      Text(
                        'Délai restant: ${widget.claim.remainingHours}h',
                        style: TextStyle(
                          color:
                              widget.claim.remainingHours < 12
                                  ? Colors.red
                                  : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(widget.claim.description),
              ),
            ),
            const SizedBox(height: 16),

            // Attachments (if any)
            const Text(
              'Pièces jointes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Aucune pièce jointe pour le moment'),
              ),
            ),
            const SizedBox(height: 16),

            // Actions
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Assign to service
                    DropdownButtonFormField(
                      value: _selectedService,
                      items: const [
                        DropdownMenuItem(
                          value: 'Import',
                          child: Text('Import'),
                        ),
                        DropdownMenuItem(
                          value: 'Export',
                          child: Text('Export'),
                        ),
                        DropdownMenuItem(
                          value: 'Contentieux',
                          child: Text('Contentieux'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedService = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Attribuer à un service',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Write message to client
                    TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Écrire un message au client',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Update status
                    const Text('Mettre à jour le statut:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.claim.status = 'Nouveau';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Nouveau'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.claim.status = 'En cours';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('En cours'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.claim.status = 'Résolu';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Résolu'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Save button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Save changes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Modifications enregistrées')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                ),
                child: const Text('Enregistrer les modifications'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// AGENT SECTION - Claim Model
class AgentClaim {
  String id;
  String clientName;
  String claimType;
  DateTime date;
  String status;
  String containerId;
  String description;
  String contactInfo;
  int remainingHours;

  AgentClaim({
    required this.id,
    required this.clientName,
    required this.claimType,
    required this.date,
    required this.status,
    required this.containerId,
    required this.description,
    required this.contactInfo,
    required this.remainingHours,
  });
}
