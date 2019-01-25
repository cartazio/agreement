{-# LANGUAGE GADTs, DataKinds, ScopedTypeVariables #-}
{-# LANGUAGE DeriveDataTypeable, DeriveFunctor, DeriveFoldable, DeriveTraversable #-}

{- |
This is a working code specificational model of view stamped replication
 -}
module Control.Agreement.Leader.ViewStamped.FormalViewStamped where

{-
notes:
*  m == message and op = operation seem to be the same thing?
requestNumber is a per client sequencing number?
* the execution of m/op is sometimes called an "upCall" into
* using _ _ _ ... style notation for "bunch of parameters ill write down later"

record Replica  clientid operation clientRequest

  ClientRequestToPrimary :: operation -> clientId -> requestNumber
            -> m (Replica _ _ _ _ _ _)
  PrimaryPrepareToReplica :: viewNumber -> operation ->  viewNumber ->
      commitNumber -> m (Replica _ _ _ _ )
  PrepareOkToPrimary :: viewNumber -> opNumber ->
        replicaID -> m (Replica _ _ _ )
-}
