triggeredMessage := Watched.clearWhenTriggered

libraryDependencies += "com.lihaoyi" % "ammonite" % "0.9.4" % "test" cross CrossVersion.full

initialCommands in (Test, console) := """ammonite.Main().run()"""

watchSources ++= (
     (baseDirectory.value * "*.sbt").get
  ++ (baseDirectory.value / "project" * "*.scala").get
  ++ (baseDirectory.value / "project" * "*.sbt").get
)

addCommandAlias("tc", "test:compile")
addCommandAlias("amm", "test:console")
addCommandAlias("itc", "it:compile")

addCommandAlias("rtu", "; reload ; test:update")
addCommandAlias("rtc", "; reload ; test:compile")
addCommandAlias("ru", "; reload ; update")
addCommandAlias("rc", "; reload ; compile")
