-- temperatureIO.hs
module TemperatureIO where
import Control.Concurrent

main = do
  contents <- readFile "/sys/bus/w1/devices/28-02162526cbee/w1_slave"
  threadDelay 1000000
  print $ take 5 $ drop 69 contents 
  main
   
