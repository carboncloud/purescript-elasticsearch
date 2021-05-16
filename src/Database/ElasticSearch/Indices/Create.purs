module Database.ElasticSearch.Indices.Create where

import Database.ElasticSearch.Common (Api, Cast, DataType, Optional, api)
import Database.ElasticSearch.Internal as Internal
import Foreign.Object (Object)
import Untagged.Castable (cast)

type CreateIndexParams =
  ( index :: String
  , include_type_name :: Optional Boolean
  , wait_for_active_shards :: Optional String
  , timeout :: Optional String
  , master_timeout :: Optional String
  , body :: Optional CreateIndexBody
  )

type CreateIndexBody =
  { aliases :: Optional (Object Alias)
  , mappings :: Optional {properties :: Object Mapping}
  , settings :: Optional Settings
  }

type Alias =
  { routing :: Optional String
  , index_routing :: Optional String
  , search_routing :: Optional String
  , is_hidden :: Optional Boolean
  , is_write_index :: Optional Boolean
  }

type Mapping = {type :: DataType , index :: Optional Boolean}

type Settings = {number_of_shards :: Optional Int, number_of_replicas :: Optional Int}

createIndexBody :: Cast CreateIndexBody
createIndexBody = cast

alias :: Cast Alias
alias = cast

mapping :: Cast Mapping
mapping = cast

settings :: Cast Settings
settings = cast

createIndex :: Api CreateIndexParams (acknowledged :: Boolean)
createIndex = api Internal.createIndex
