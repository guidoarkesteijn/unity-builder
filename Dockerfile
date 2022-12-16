# Dockerfile
FROM unityci/editor:ubuntu-2022.1.23f1-webgl-1.0.1 AS build-env

FROM unityci/editor:ubuntu-2022.2.0f1-webgl-1.0.1

WORKDIR /opt/unity/Editor/Data/PlaybackEngines/WebGLSupport/BuildTools`

RUN ls

# remove broken llvm from install.
RUN rm -rf Emscripten

# copy over working version from 2022.1 to 2022.2
COPY --from=build-env /opt/unity/Editor/Data/PlaybackEngines/WebGLSupport/BuildTools/Emscripten Emscripten

WORKDIR /