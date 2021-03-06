<g:applyLayout name="main">
%{--    <div class="wrapper" id="simulationMainContainer">--}%

%{--    </div>--}%

    <div class="wrapper" >
        <div class="content-wrapper container">
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <g:form controller="training" action="readingComplete">
                        <g:each var="passage" in="${readingTasks}" status="i">
                            <div class="col-md-12">
                            <strong style="color:midnightblue;font-size:40px;">Section ${i+1}</strong>
                            <p>${passage.passage}</p>
                            <g:each var="question" in="${passage.questions.sort{it.id}}" status="j">


                                <p><b>Question ${j+1}:</b> ${question.question}</p>

                                <g:each var="option" in="${question.options}" status="m">


                                    <g:radio name="question${question.id}" value="${m}" required=""/>
                                    <label>${option}</label>
                                    <p></p>

                                </g:each>
                                <p></p>


                            </g:each>

                            </div>

                        </g:each>

                                <g:hiddenField name="trainingSetId" value="${trainingSetId}"/>
                                <g:hiddenField name="assignmentId" value="${assignmentId}"/>

                                <g:submitButton name="submit" class="btn btn-success" value="Submit"/>
                            </g:form>
                    </div>
                </div>
            </section>
        </div>
    </div>

</g:applyLayout>