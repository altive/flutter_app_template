import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pokemon_repository.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(allPokemonResponseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: asyncValue.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, st) {
          debugPrint('$err');
          return Center(child: Text('$err'));
        },
        data: (response) {
          final pokemons = response.data?.pokemons?.results;
          if (pokemons == null) {
            debugPrint('Pokemons is null!');
            return const Center(child: Text('list is null'));
          }
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              final height = pokemon.height!;
              final weight = pokemon.weight!;
              return ListTile(
                leading: Text('ID: ${pokemon.id}'),
                title: Text(pokemon.name),
                subtitle: Text(
                  '${height.G__typename}: ${height.in_meter}'
                  ', '
                  '${weight.G__typename}: ${weight.in_kg}',
                ),
                // SocketException が発生して画像が表示できない
                // trailing: CachedNetworkImage(
                //   imageUrl: pokemon.avatar,
                //   width: 40,
                //   height: 40,
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
