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
* OpNumber === CommitNumber == opCommitNumber, just different times

coarsely speaking: 3 sub protocols
  normal case
  view change
  recovery from failure  / rejoin / catchup

  (also membership change, and machine local state management)

record Replica  clientid operation clientRequest

  ClientRequestToPrimary :: operation -> clientId -> requestNumber
            -> m (Replica _ _ _ _ _ _)
    -- the included opCommitNumber is for the most recent previous
  PrimaryPrepareToReplica ::
    viewNumber -> operation ->  viewNumber -> opNum  -> {- last commited -} opNum ->
         m (Replica _ _ _ _ )
  PrepareOkToPrimary :: viewNumber -> {- proposed operation-} opNum ->
          {-whoami-} replicaID ->
          m (Replica _ _ _ )
  -- add client activity idling timeout which then triggers commit
  ClientsIdlingTimeout ::  m (Rep)
  PrimaryCommitToReplica :: viewNumber -> opNum ->
      m (Replica _ _ _ )

  -- add Need viewchange event / decider
  StartViewChange ::{- New view number -} viewNumber  -> replicaID ->
      m (Replica _ _ _ )

  DoViewChange :: {- new -} viewNumber -> logJournalRep ->
        {- last known local normal -} viewNumber  ->  {- highest in log-} opNum  ->
         {- highest committed -} opNum -> replicaID -> m (Replica _ _ _ _)
  StartView :: viewNumber -> {- log from max view-} logJournalRep  ->
    {- max in log-} opNumber ->
    {- max commit from doview -} opNumber ->
    m (Replica ____)

  RecoveryRequest

  RecoveryResponse

  GetStateSnapshot

  NewStateSnapshot

  TriggerReconfiguration -- Reconfiguration

  StartEpochOfReconfig -- StartEpoch

  StartEpochConfirmation -- EpochStarted

  CheckEpoch -- client facing ?

  NewEpoch -- Client facing


-}
