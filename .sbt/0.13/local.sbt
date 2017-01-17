triggeredMessage := Watched.clearWhenTriggered

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.1" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

watchSources ++= (
     (baseDirectory.value * "*.sbt").get
  ++ (baseDirectory.value / "project" * "*.scala").get
  ++ (baseDirectory.value / "project" * "*.sbt").get
)

addCommandAlias("rtu", "; reload ; test:update")
addCommandAlias("rtc", "; reload ; test:compile")
addCommandAlias("ru", "; reload ; update")
addCommandAlias("rc", "; reload ; compile")
