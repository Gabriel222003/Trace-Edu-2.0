import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:trace_edu/Controllers/ControllerFaltas.dart';

class Faltas extends StatefulWidget {
  const Faltas({super.key});

  @override
  State<Faltas> createState() => _FaltasState();
}

class _FaltasState extends State<Faltas> {
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FaltasController(context),
      builder: (context, _) {
        final controller = context.watch<FaltasController>();

        // ✅ Agora que o provider existe, podemos carregar os dados com segurança
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          final idUsuario = await storage.read(key: 'idUsuario');
          if (idUsuario != null &&
              controller.listaMaterias.isEmpty) { // evita recarregar toda hora
            await controller.carregarDados(int.parse(idUsuario));
          }
        });

        return Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(title: const Text("Gerenciar Matérias")),
          body: SafeArea(
            child: controller.listaMaterias.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 3)),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: controller.listaMaterias.map((materia) {
                                final isOpen = ValueNotifier(false);

                                return ValueListenableBuilder(
                                  valueListenable: isOpen,
                                  builder: (context, open, _) {
                                    return ExpansionPanelList(
                                      expansionCallback: (i, expanded) {
                                        isOpen.value = !open;
                                      },
                                      children: [
                                        ExpansionPanel(
                                          isExpanded: open,
                                          headerBuilder: (context, _) {
                                            return ListTile(
                                              title: Text(
                                                materia.nomeMateria,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                    255,
                                                    108,
                                                    193,
                                                    232,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          body: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Gerencie suas faltas:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                      255,
                                                      108,
                                                      193,
                                                      232,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Você possui ${materia.qtdFaltas} faltas",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: TextButton.icon(
                                                        onPressed: () async {
                                                          final idUsuario = await storage.read(key: 'idUsuario');
                                                          await controller
                                                              .adicionarFalta(
                                                                  materia
                                                                      .idMateria, int.parse(idUsuario as String));
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color: Colors.green,
                                                        ),
                                                        label: const Text(
                                                            'Adicionar'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton.icon(
                                                        onPressed: () async {
                                                          final idUsuario = await storage.read(key: 'idUsuario');
                                                          await controller
                                                              .removerFalta(
                                                                  materia
                                                                      .idMateria, int.parse(idUsuario as String));
                                                        },
                                                        icon: const Icon(
                                                          Icons.remove,
                                                          color: Colors.redAccent,
                                                        ),
                                                        label: const Text(
                                                            'Remover'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextButton.icon(
                                                        onPressed: () async {
                                                          final idUsuario = await storage.read(key: 'idUsuario');
                                                          await controller
                                                              .excluirMateria(
                                                                  materia
                                                                      .idMateria, int.parse(idUsuario as String));
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color: Colors.black,
                                                        ),
                                                        label: const Text(
                                                            'Excluir'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          backgroundColor: open
                                              ? const Color.fromARGB(
                                                  255, 32, 59, 117)
                                              : const Color.fromARGB(
                                                  255, 38, 75, 145),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4FAAFF),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/cadastrarMateria');
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add_box_rounded,
                                    color: Colors.white, size: 28),
                                SizedBox(width: 8),
                                Text(
                                  "Adicionar Matéria",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
