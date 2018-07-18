triggeredMessage := Watched.clearWhenTriggered

watchSources ++= (
     (baseDirectory.value * "*.sbt").get
  ++ (baseDirectory.value / "project" * "*.scala").get
  ++ (baseDirectory.value / "project" * "*.sbt").get
)

addCommandAlias("tc", "test:compile")
addCommandAlias("itc", "it:compile")

addSbtPlugin("com.scalapenos" % "sbt-prompt" % "1.0.2")
