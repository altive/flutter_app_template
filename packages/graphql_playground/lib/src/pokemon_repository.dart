import 'package:ferry/ferry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'client.dart';
import 'graphql/__generated__/all_pokemon.data.gql.dart';
import 'graphql/__generated__/all_pokemon.req.gql.dart';
import 'graphql/__generated__/all_pokemon.var.gql.dart';

final _repositoryProvider = Provider(
  (ref) => PokemonRepository(ref.watch(apiClientProvider)),
);

/// ポケモンのリストデータレスポンス
final allPokemonResponseProvider = StreamProvider((ref) {
  return ref.watch(_repositoryProvider).getAllPokemon();
});

/// ポケモンのリストデータのみ
final allPokemonProvider = Provider((ref) {
  return ref
      .watch(allPokemonResponseProvider)
      .whenData((response) => response.data?.pokemons?.results?.toList());
});

class PokemonRepository {
  PokemonRepository(this._client);

  final ApiClient _client;

  Stream<OperationResponse<GAllPokemonData, GAllPokemonVars>> getAllPokemon({
    int limit = 151,
    int offset = 0,
  }) {
    final allPokemonReq = GAllPokemonReq((b) {
      return b
        // 取得数
        ..vars.limit = limit
        // 開始位置
        ..vars.offset = offset;
    });
    final r = _client.request(allPokemonReq);
    return r;
  }
}
