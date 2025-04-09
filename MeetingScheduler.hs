{-# LANGUAGE OverloadedStrings #-}

import System.IO (hFlush, stdout)
import Data.List (intercalate)
import Control.Monad (forever)
import Text.Printf (printf)

-- Meeting data type
data Meeting = Meeting {
    title       :: String,
    date        :: String,
    time        :: String,
    participants :: [String]
} deriving (Show)

-- Main function
main :: IO ()
main = do
    putStrLn "------------------------------------------"
    putStrLn "                                          "
    putStrLn "Welcome to the Fabulous Meeting Scheduler!"
    putStrLn "                                          "
    putStrLn "------------------------------------------"
    putStrLn "Let's schedule your meetings interactively.\n"
    scheduler []

-- Scheduler function
scheduler :: [Meeting] -> IO ()
scheduler meetings = do
    putStrLn "\nWhat would you like to do?"
    putStrLn "1. Schedule a new meeting"
    putStrLn "2. View scheduled meetings"
    putStrLn "3. Exit"
    putStr "Enter your choice (1/2/3): "
    hFlush stdout
    choice <- getLine
    case choice of
        "1" -> do
            newMeeting <- createMeeting
            scheduler (meetings ++ [newMeeting])
        "2" -> do
            viewMeetings meetings
            scheduler meetings
        "3" -> do
            putStrLn "\nThank you for using the Fabulous Meeting Scheduler!"
            putStrLn "Goodbye!"
        _ -> do
            putStrLn "\nInvalid choice! Please try again."
            scheduler meetings

-- Function to create a new meeting
createMeeting :: IO Meeting
createMeeting = do
    putStrLn "\n--- Schedule a New Meeting ---"
    putStr "Enter meeting title: "
    hFlush stdout
    title <- getLine
    
    putStr "Enter meeting date (e.g., 2025-04-08): "
    hFlush stdout
    date <- getLine
    
    putStr "Enter meeting time (e.g., 11:00 AM): "
    hFlush stdout
    time <- getLine
    
    putStr "Enter participants (comma-separated): "
    hFlush stdout
    participantsInput <- getLine
    
    let participants = map trim $ splitBy ',' participantsInput
    
    putStrLn "\nMeeting successfully scheduled!\n"
    
    return $ Meeting title date time participants

-- Function to view scheduled meetings
viewMeetings :: [Meeting] -> IO ()
viewMeetings [] = do
    putStrLn "\nNo meetings scheduled yet!"
viewMeetings meetings = do
    putStrLn "\n--- Scheduled Meetings ---"
    mapM_ printMeetingWithBorder (zip [1..] meetings)
    
-- Helper function to print a meeting with a border for aesthetics
printMeetingWithBorder :: (Int, Meeting) -> IO ()
printMeetingWithBorder (index, Meeting title date time participants) = do
    let border = replicate 50 '-'
        participantList = intercalate ", " participants
    
    printf "\n%s\n" border
    printf "| %d. Title: %s\n" index title
    printf "| Date: %s\n" date
    printf "| Time: %s\n" time
    printf "| Participants: %s\n" participantList
    printf "%s\n" border

-- Helper function to split strings by delimiter and trim whitespace
splitBy :: Char -> String -> [String]
splitBy delim str =
  case break (== delim) str of
      (a, _:b) -> a : splitBy delim b
      (a, "")  -> [a]

trim :: String -> String
trim = f . f where f = reverse . dropWhile (== ' ')

