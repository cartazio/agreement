{-# LANGUAGE GADTs, DataKinds, ScopedTypeVariables #-}
{-# LANGUAGE DeriveDataTypeable, DeriveFunctor, DeriveFoldable, DeriveTraversable #-}

module Control.Agreement.Leader.Raft.FormalRaft where


{-
Term Selection/ Stale Term Detection

Catchup
  gets stuck if current leader fails!?
  Stuck in Stale read only mode until hears from new leader?

Timeout / Failure Detection (of Current Leader of Current Term)
  Raft approach requires both accurate timeout being some number >> networking round trip time
  for cluster, plus randomized delay on top for symmetry breaking of candidacy

Leader election As Candidate
  Triggered by Failure Detector, vote for self, ask everyone for a vote
  if enough votes, leader, tell everyone that
    (vanilla version has no signatures to check claim etc )

Leader election as Not Candidate, aka VOTER
  Participates in those with valid term number
  (which higher terms are valid)

Append Entries Cycle
    Persist proposal to disk on leader
    Send AppendEntries Request from Leader
    Is It written to disk / persisted by follower?
    then send Append Entries Reply from Followers
    Is it Marked as Committed / accepted by a quorum of nodes?
    then send Advance COmmit to followers from leader

Is Quorum Good ?? ???

Membership
  should only be changed by admin command
    some intersection / time delay / propagation tricks

Log GC --- Raft doesn't do GC/Snapshot in vanilla spec/ log compactions

Restarts from LOCAL Log / Snapshot

Disk Writes to durable log
-}
