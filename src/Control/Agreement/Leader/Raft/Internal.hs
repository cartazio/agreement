{-# LANGUAGE GADTs, DataKinds, ScopedTypeVariables #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DeriveDataTypeable, DeriveFunctor, DeriveFoldable, DeriveTraversable #-}

module Control.Agreement.Leader.Raft.Internal where


{-
Term Selection/ Stale Term

Catchup

Timeout / Failure Detection

Leader election

Append Entries Cycle
    Is It written to disk
    Is it Marked as Committed / accepted?

Is Quorum Good ?? ??? / Membership

Log GC --- Raft doesn't do GC/Snapshot in vanilla spec/ log compactions

Restarts from LOCAL Log / Snapshot

Disk Writes to durable log
-}
